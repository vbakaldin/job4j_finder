package ru.job4j;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.PathMatcher;
import java.util.List;
import java.util.function.Predicate;
import java.util.regex.Pattern;

public class FileFinder {
    private static final String USAGE = "Usage: -d=directory -n=name -t=name|mask|regex -o=output.txt";

    private static void validate(ArgsName argsName) {
        Path directory = Path.of(argsName.get("d"));
        String name = argsName.get("n");
        String type = argsName.get("t");
        Path output = Path.of(argsName.get("o"));
        if (!Files.exists(directory)) {
            throw new IllegalArgumentException("Directory does not exist. " + USAGE);
        }
        if (!Files.isDirectory(directory)) {
            throw new IllegalArgumentException("The path is not a directory. " + USAGE);
        }
        if (name.isBlank()) {
            throw new IllegalArgumentException("File name is empty. " + USAGE);
        }
        if (!"name".equals(type) && !"mask".equals(type) && !"regex".equals(type)) {
            throw new IllegalArgumentException("Unknown search type. " + USAGE);
        }
        if (Files.isDirectory(output)) {
            throw new IllegalArgumentException("Output path is a directory. " + USAGE);
        }
    }

    private static Predicate<Path> getCondition(String name, String type) {
        Predicate<Path> condition;
        if ("name".equals(type)) {
            condition = path -> path.getFileName().toString().equals(name);
        } else if ("mask".equals(type)) {
            PathMatcher matcher = FileSystems.getDefault().getPathMatcher("glob:" + name);
            condition = path -> matcher.matches(path.getFileName());
        } else {
            Pattern pattern = Pattern.compile(name);
            condition = path -> pattern.matcher(path.getFileName().toString()).matches();
        }
        return condition;
    }

    public static void main(String[] args) throws IOException {
        if (args.length != 4) {
            throw new IllegalArgumentException(USAGE);
        }
        ArgsName argsName = ArgsName.of(args);
        validate(argsName);
        Path directory = Path.of(argsName.get("d"));
        String name = argsName.get("n");
        String type = argsName.get("t");
        Path output = Path.of(argsName.get("o"));
        List<Path> paths = Search.search(directory, getCondition(name, type));
        try (PrintWriter writer = new PrintWriter(output.toFile())) {
            paths.forEach(writer::println);
        }
    }
}