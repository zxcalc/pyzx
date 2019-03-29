// Initial wiring: [9, 18, 5, 15, 14, 16, 12, 3, 2, 1, 13, 6, 4, 8, 10, 7, 17, 11, 19, 0]
// Resulting wiring: [9, 18, 5, 15, 14, 16, 12, 3, 2, 1, 13, 6, 4, 8, 10, 7, 17, 11, 19, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[13];
cx q[13], q[6];
cx q[16], q[13];
cx q[12], q[17];
