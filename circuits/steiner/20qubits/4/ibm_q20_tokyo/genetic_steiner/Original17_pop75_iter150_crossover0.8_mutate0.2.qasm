// Initial wiring: [3, 18, 9, 16, 12, 7, 8, 19, 15, 4, 11, 6, 2, 14, 0, 1, 5, 13, 17, 10]
// Resulting wiring: [3, 18, 9, 16, 12, 7, 8, 19, 15, 4, 11, 6, 2, 14, 0, 1, 5, 13, 17, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[9];
cx q[18], q[12];
cx q[13], q[14];
cx q[2], q[3];
