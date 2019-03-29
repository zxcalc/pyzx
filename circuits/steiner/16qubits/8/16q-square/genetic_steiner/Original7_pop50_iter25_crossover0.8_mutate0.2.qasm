// Initial wiring: [9, 5, 0, 8, 2, 11, 7, 13, 14, 3, 15, 1, 4, 6, 10, 12]
// Resulting wiring: [9, 5, 0, 8, 2, 11, 7, 13, 14, 3, 15, 1, 4, 6, 10, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[7], q[6];
cx q[14], q[9];
cx q[9], q[6];
cx q[14], q[13];
cx q[14], q[9];
cx q[12], q[13];
cx q[6], q[9];
cx q[4], q[5];
cx q[5], q[6];
cx q[6], q[9];
