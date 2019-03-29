// Initial wiring: [15, 13, 9, 11, 14, 12, 0, 6, 3, 10, 4, 2, 8, 1, 5, 7]
// Resulting wiring: [15, 13, 9, 11, 14, 12, 0, 6, 3, 10, 4, 2, 8, 1, 5, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[6], q[5];
cx q[5], q[4];
cx q[10], q[9];
cx q[10], q[5];
cx q[9], q[6];
cx q[5], q[4];
cx q[10], q[9];
cx q[14], q[9];
cx q[9], q[8];
cx q[9], q[6];
cx q[8], q[7];
cx q[6], q[5];
cx q[7], q[0];
cx q[8], q[7];
cx q[9], q[6];
cx q[14], q[9];
cx q[15], q[8];
cx q[8], q[7];
cx q[7], q[0];
cx q[8], q[7];
cx q[15], q[8];
cx q[11], q[12];
cx q[1], q[2];
