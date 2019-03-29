// Initial wiring: [9, 15, 4, 18, 14, 3, 6, 13, 10, 19, 12, 11, 1, 8, 5, 17, 7, 16, 2, 0]
// Resulting wiring: [9, 15, 4, 18, 14, 3, 6, 13, 10, 19, 12, 11, 1, 8, 5, 17, 7, 16, 2, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[6];
cx q[14], q[5];
cx q[11], q[12];
cx q[10], q[11];
