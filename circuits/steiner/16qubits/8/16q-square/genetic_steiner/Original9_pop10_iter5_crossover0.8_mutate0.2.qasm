// Initial wiring: [5, 3, 11, 13, 12, 14, 6, 10, 7, 1, 4, 0, 9, 2, 15, 8]
// Resulting wiring: [5, 3, 11, 13, 12, 14, 6, 10, 7, 1, 4, 0, 9, 2, 15, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[7], q[6];
cx q[6], q[5];
cx q[6], q[1];
cx q[8], q[7];
cx q[14], q[9];
cx q[9], q[6];
cx q[6], q[1];
cx q[14], q[13];
cx q[9], q[6];
cx q[15], q[14];
cx q[15], q[8];
cx q[14], q[13];
cx q[8], q[7];
cx q[15], q[8];
cx q[15], q[14];
cx q[5], q[6];
cx q[4], q[5];
cx q[5], q[6];
