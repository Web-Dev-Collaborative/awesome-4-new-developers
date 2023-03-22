"""TensorFlow workspace initialization. Consult the WORKSPACE on how to use it."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//third_party:tf_runtime/workspace.bzl", tf_runtime = "repo")

def workspace():
    http_archive(
        name = "io_bazel_rules_closure",
        sha256 = "13601fd4eb4f7e583a80f6de2c58d8b5ca19f346cbf959e66b9d57d32f15b617",
        strip_prefix = "rules_closure-7860dec6f1d7870d720ea6ef3f599c0397866fc9",
        urls = [
            "https://storage.googleapis.com/mirror.tensorflow.org/github.com/bazelbuild/rules_closure/archive/7860dec6f1d7870d720ea6ef3f599c0397866fc9.tar.gz",
            "https://github.com/bazelbuild/rules_closure/archive/7860dec6f1d7870d720ea6ef3f599c0397866fc9.tar.gz",  # 2019-06-13
        ],
    )

    http_archive(
        name = "tf_toolchains",
        sha256 = "072753865000f81b5686edd273ae74d35361cfa0b16bb1b3400c25d0908f4863",
        strip_prefix = "toolchains-1.2.6",
        urls = [
            "http://mirror.tensorflow.org/github.com/tensorflow/toolchains/archive/v1.2.6.tar.gz",
            "https://github.com/tensorflow/toolchains/archive/v1.2.6.tar.gz",
        ],
    )

    tf_runtime()

# Alias so it can be loaded without assigning to a different symbol to prevent
# shadowing previous loads and trigger a buildifier warning.
tf_workspace3 = workspace
