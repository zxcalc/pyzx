// Initial wiring: [2, 5, 9, 16, 12, 18, 8, 19, 0, 15, 10, 7, 4, 6, 11, 13, 17, 14, 3, 1]
// Resulting wiring: [2, 5, 9, 16, 12, 18, 8, 19, 0, 15, 10, 7, 4, 6, 11, 13, 17, 14, 3, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[11], q[8];
cx q[14], q[13];
cx q[16], q[15];
cx q[16], q[17];
cx q[5], q[6];
