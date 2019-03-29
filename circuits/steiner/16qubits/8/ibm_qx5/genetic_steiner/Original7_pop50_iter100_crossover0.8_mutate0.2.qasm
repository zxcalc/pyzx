// Initial wiring: [4, 1, 5, 3, 11, 12, 0, 15, 9, 8, 14, 2, 7, 13, 10, 6]
// Resulting wiring: [4, 1, 5, 3, 11, 12, 0, 15, 9, 8, 14, 2, 7, 13, 10, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[11], q[4];
cx q[4], q[3];
cx q[14], q[13];
cx q[13], q[12];
cx q[14], q[13];
cx q[14], q[15];
cx q[3], q[12];
cx q[0], q[15];
