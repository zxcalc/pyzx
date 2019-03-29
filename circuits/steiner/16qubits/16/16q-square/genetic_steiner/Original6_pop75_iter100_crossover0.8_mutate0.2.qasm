// Initial wiring: [14, 0, 1, 4, 11, 6, 2, 13, 10, 3, 12, 5, 9, 8, 7, 15]
// Resulting wiring: [14, 0, 1, 4, 11, 6, 2, 13, 10, 3, 12, 5, 9, 8, 7, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[7], q[6];
cx q[6], q[5];
cx q[7], q[0];
cx q[9], q[6];
cx q[6], q[5];
cx q[9], q[8];
cx q[9], q[6];
cx q[15], q[14];
cx q[14], q[13];
cx q[12], q[13];
cx q[10], q[13];
cx q[6], q[7];
cx q[5], q[6];
cx q[4], q[5];
cx q[4], q[11];
cx q[5], q[6];
cx q[1], q[2];
