// Initial wiring: [10, 3, 9, 2, 12, 11, 5, 0, 8, 14, 7, 15, 13, 1, 4, 6]
// Resulting wiring: [10, 3, 9, 2, 12, 11, 5, 0, 8, 14, 7, 15, 13, 1, 4, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[7], q[6];
cx q[6], q[1];
cx q[7], q[6];
cx q[9], q[6];
cx q[6], q[1];
cx q[9], q[6];
cx q[14], q[13];
