// Initial wiring: [3, 6, 9, 15, 5, 14, 7, 4, 2, 0, 13, 8, 1, 12, 11, 10]
// Resulting wiring: [3, 6, 9, 15, 5, 14, 7, 4, 2, 0, 13, 8, 1, 12, 11, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[6], q[1];
cx q[7], q[6];
cx q[6], q[5];
cx q[7], q[6];
cx q[8], q[7];
cx q[7], q[6];
cx q[6], q[5];
cx q[7], q[6];
cx q[9], q[6];
cx q[6], q[5];
cx q[5], q[4];
cx q[9], q[6];
cx q[14], q[9];
cx q[9], q[14];
cx q[6], q[9];
cx q[9], q[14];
cx q[14], q[13];
