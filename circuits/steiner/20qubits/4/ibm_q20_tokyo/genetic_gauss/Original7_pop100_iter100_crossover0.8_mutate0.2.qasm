// Initial wiring: [1, 3, 18, 8, 19, 5, 14, 12, 0, 17, 15, 11, 2, 10, 6, 13, 7, 4, 16, 9]
// Resulting wiring: [1, 3, 18, 8, 19, 5, 14, 12, 0, 17, 15, 11, 2, 10, 6, 13, 7, 4, 16, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[1];
cx q[11], q[0];
cx q[7], q[11];
cx q[3], q[14];
