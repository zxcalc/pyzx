// Initial wiring: [13, 16, 8, 7, 1, 19, 18, 14, 5, 11, 17, 12, 6, 4, 10, 15, 0, 3, 2, 9]
// Resulting wiring: [13, 16, 8, 7, 1, 19, 18, 14, 5, 11, 17, 12, 6, 4, 10, 15, 0, 3, 2, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[8];
cx q[14], q[15];
cx q[6], q[13];
cx q[6], q[7];
