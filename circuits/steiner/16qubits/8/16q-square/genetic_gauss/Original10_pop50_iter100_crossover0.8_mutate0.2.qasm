// Initial wiring: [8, 7, 4, 14, 10, 11, 2, 0, 15, 9, 13, 3, 6, 1, 12, 5]
// Resulting wiring: [8, 7, 4, 14, 10, 11, 2, 0, 15, 9, 13, 3, 6, 1, 12, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[5], q[2];
cx q[11], q[7];
cx q[15], q[12];
cx q[14], q[6];
cx q[12], q[8];
cx q[7], q[12];
cx q[1], q[7];
