guess.binary <- ifelse(WINDOWS, "GUESS.exe", "GUESS")
if (file.exists(guess.binary)) {
    dest <- file.path(
        R_PACKAGE_DIR,
        ifelse(nzchar(R_ARCH), file.path("bin", R_ARCH), "bin")
    )
    dir.create(dest, showWarnings=FALSE, recursive=TRUE)
    file.copy(guess.binary, dest, overwrite=TRUE)
}

