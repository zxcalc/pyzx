// Initial wiring: [0, 17, 14, 1, 18, 9, 10, 4, 16, 7, 13, 6, 11, 19, 3, 5, 15, 2, 12, 8]
// Resulting wiring: [0, 17, 14, 1, 18, 9, 10, 4, 16, 7, 13, 6, 11, 19, 3, 5, 15, 2, 12, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[7];
cx q[19], q[18];
cx q[10], q[19];
cx q[7], q[15];
