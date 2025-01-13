
#include <Python.h>

PyObject* add(PyObject *self, PyObject *args) {
	int x, y;
	if (!PyArg_ParseTuple(args, "ii", &x, &y)) return NULL;
	int z = x + y;
	return PyLong_FromLong(z);
}

PyMethodDef aritm_funcs[] = {
    {"add", add, METH_VARARGS, "Sestej dve celi stevili"},
    {NULL}
};

PyModuleDef aritm_mod = {
	PyModuleDef_HEAD_INIT,
	"aritm",
	"Modul za aritmeticne operacije",
	-1,
	aritm_funcs
};

PyMODINIT_FUNC PyInit_aritm(void) {
	return PyModule_Create(&aritm_mod);
}
