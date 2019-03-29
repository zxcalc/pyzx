// Initial wiring: [9, 2, 12, 15, 7, 14, 8, 10, 1, 0, 5, 3, 6, 11, 4, 13]
// Resulting wiring: [9, 2, 12, 15, 7, 14, 8, 10, 1, 0, 5, 3, 6, 11, 4, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[2], q[1];
cx q[5], q[4];
cx q[8], q[7];
cx q[9], q[8];
cx q[14], q[13];
cx q[11], q[12];
cx q[0], q[1];
