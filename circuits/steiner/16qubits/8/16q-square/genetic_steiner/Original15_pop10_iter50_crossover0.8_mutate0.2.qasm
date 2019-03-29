// Initial wiring: [12, 6, 5, 1, 3, 9, 0, 7, 14, 11, 15, 4, 13, 8, 10, 2]
// Resulting wiring: [12, 6, 5, 1, 3, 9, 0, 7, 14, 11, 15, 4, 13, 8, 10, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[9], q[6];
cx q[10], q[9];
cx q[9], q[6];
cx q[11], q[4];
cx q[12], q[11];
cx q[15], q[8];
cx q[8], q[7];
cx q[13], q[14];
cx q[6], q[9];
cx q[4], q[11];
cx q[3], q[4];
cx q[4], q[11];
cx q[11], q[4];
