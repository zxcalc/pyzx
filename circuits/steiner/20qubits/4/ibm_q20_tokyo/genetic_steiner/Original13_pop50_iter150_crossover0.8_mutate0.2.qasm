// Initial wiring: [7, 10, 15, 5, 9, 4, 6, 0, 3, 14, 16, 11, 2, 1, 8, 13, 18, 19, 17, 12]
// Resulting wiring: [7, 10, 15, 5, 9, 4, 6, 0, 3, 14, 16, 11, 2, 1, 8, 13, 18, 19, 17, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[8];
cx q[13], q[6];
cx q[16], q[15];
cx q[14], q[15];
