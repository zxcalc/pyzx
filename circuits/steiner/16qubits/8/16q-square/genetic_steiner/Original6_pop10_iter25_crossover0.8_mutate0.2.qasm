// Initial wiring: [9, 14, 2, 7, 8, 0, 15, 13, 5, 10, 1, 3, 4, 11, 6, 12]
// Resulting wiring: [9, 14, 2, 7, 8, 0, 15, 13, 5, 10, 1, 3, 4, 11, 6, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[5], q[2];
cx q[6], q[5];
cx q[7], q[6];
cx q[6], q[5];
cx q[5], q[2];
cx q[7], q[0];
cx q[6], q[5];
cx q[7], q[6];
cx q[9], q[6];
cx q[14], q[13];
cx q[8], q[15];
cx q[6], q[9];
cx q[9], q[14];
cx q[5], q[6];
cx q[6], q[9];
cx q[9], q[14];
cx q[1], q[2];
