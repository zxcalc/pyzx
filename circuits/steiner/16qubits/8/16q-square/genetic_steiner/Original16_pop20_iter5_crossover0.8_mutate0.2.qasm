// Initial wiring: [15, 6, 10, 2, 4, 5, 14, 7, 12, 1, 9, 8, 3, 13, 0, 11]
// Resulting wiring: [15, 6, 10, 2, 4, 5, 14, 7, 12, 1, 9, 8, 3, 13, 0, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[7], q[6];
cx q[6], q[1];
cx q[7], q[6];
cx q[9], q[6];
cx q[14], q[9];
cx q[9], q[6];
cx q[6], q[5];
cx q[14], q[9];
cx q[15], q[8];
cx q[8], q[15];
cx q[7], q[8];
cx q[8], q[15];
cx q[15], q[14];
cx q[5], q[6];
cx q[4], q[5];
cx q[3], q[4];
cx q[4], q[5];
cx q[5], q[6];
