// Initial wiring: [1, 15, 5, 3, 7, 6, 8, 10, 4, 14, 12, 0, 13, 9, 2, 11]
// Resulting wiring: [1, 15, 5, 3, 7, 6, 8, 10, 4, 14, 12, 0, 13, 9, 2, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[2], q[1];
cx q[5], q[2];
cx q[9], q[8];
cx q[11], q[4];
cx q[14], q[13];
cx q[15], q[8];
cx q[13], q[14];
cx q[10], q[13];
cx q[13], q[14];
cx q[14], q[13];
cx q[4], q[11];
cx q[11], q[4];
cx q[3], q[4];
cx q[4], q[11];
cx q[4], q[5];
cx q[11], q[4];
cx q[2], q[5];
