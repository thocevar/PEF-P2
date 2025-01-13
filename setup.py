
from setuptools import setup, Extension

setup(
    name = "aritm",
    version = "1.0",
    ext_modules = [Extension("aritm", ["libaritm.c"])]
)
