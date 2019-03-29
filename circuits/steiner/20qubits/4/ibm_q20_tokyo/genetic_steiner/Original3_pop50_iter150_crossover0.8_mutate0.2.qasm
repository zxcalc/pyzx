// Initial wiring: [4, 5, 18, 19, 11, 2, 12, 0, 13, 17, 15, 14, 10, 1, 8, 7, 16, 3, 6, 9]
// Resulting wiring: [4, 5, 18, 19, 11, 2, 12, 0, 13, 17, 15, 14, 10, 1, 8, 7, 16, 3, 6, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[7];
cx q[16], q[15];
cx q[18], q[11];
cx q[9], q[10];
