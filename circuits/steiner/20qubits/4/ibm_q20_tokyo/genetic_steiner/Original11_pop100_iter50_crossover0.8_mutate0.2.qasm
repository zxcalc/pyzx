// Initial wiring: [15, 18, 11, 8, 3, 6, 0, 1, 17, 16, 19, 5, 9, 4, 10, 7, 13, 2, 14, 12]
// Resulting wiring: [15, 18, 11, 8, 3, 6, 0, 1, 17, 16, 19, 5, 9, 4, 10, 7, 13, 2, 14, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[16], q[17];
cx q[9], q[11];
cx q[2], q[8];
