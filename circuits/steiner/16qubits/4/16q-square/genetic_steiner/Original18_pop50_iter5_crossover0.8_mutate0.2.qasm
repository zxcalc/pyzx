// Initial wiring: [3, 4, 5, 10, 7, 9, 6, 2, 8, 1, 12, 15, 14, 11, 0, 13]
// Resulting wiring: [3, 4, 5, 10, 7, 9, 6, 2, 8, 1, 12, 15, 14, 11, 0, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[7], q[6];
cx q[6], q[5];
cx q[7], q[6];
cx q[10], q[5];
cx q[11], q[10];
cx q[8], q[15];
