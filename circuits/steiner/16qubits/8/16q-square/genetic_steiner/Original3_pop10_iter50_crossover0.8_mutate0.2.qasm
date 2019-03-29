// Initial wiring: [3, 4, 13, 9, 14, 0, 12, 15, 11, 10, 7, 1, 6, 5, 8, 2]
// Resulting wiring: [3, 4, 13, 9, 14, 0, 12, 15, 11, 10, 7, 1, 6, 5, 8, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[9], q[8];
cx q[14], q[13];
cx q[15], q[14];
cx q[14], q[13];
cx q[15], q[14];
cx q[14], q[15];
cx q[8], q[15];
cx q[6], q[7];
cx q[2], q[5];
cx q[1], q[2];
cx q[2], q[5];
cx q[0], q[1];
