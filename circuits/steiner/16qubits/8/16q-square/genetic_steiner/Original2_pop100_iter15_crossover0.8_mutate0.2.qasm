// Initial wiring: [15, 9, 11, 5, 4, 13, 2, 12, 7, 3, 8, 0, 1, 10, 6, 14]
// Resulting wiring: [15, 9, 11, 5, 4, 13, 2, 12, 7, 3, 8, 0, 1, 10, 6, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[4], q[3];
cx q[3], q[2];
cx q[4], q[3];
cx q[15], q[8];
cx q[12], q[13];
cx q[11], q[12];
cx q[9], q[14];
cx q[1], q[6];
cx q[0], q[7];
cx q[7], q[6];
