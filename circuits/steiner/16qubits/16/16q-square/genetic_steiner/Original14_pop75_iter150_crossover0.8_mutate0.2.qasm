// Initial wiring: [1, 10, 8, 7, 14, 13, 0, 15, 11, 12, 5, 2, 3, 4, 9, 6]
// Resulting wiring: [1, 10, 8, 7, 14, 13, 0, 15, 11, 12, 5, 2, 3, 4, 9, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[6], q[5];
cx q[7], q[0];
cx q[8], q[7];
cx q[7], q[0];
cx q[9], q[6];
cx q[6], q[5];
cx q[12], q[11];
cx q[11], q[4];
cx q[13], q[12];
cx q[12], q[11];
cx q[11], q[4];
cx q[15], q[14];
cx q[10], q[11];
cx q[11], q[12];
cx q[8], q[9];
cx q[6], q[7];
cx q[7], q[6];
cx q[5], q[6];
cx q[6], q[7];
cx q[7], q[6];
cx q[1], q[6];
cx q[6], q[7];
