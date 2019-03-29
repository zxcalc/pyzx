// Initial wiring: [12, 8, 3, 13, 5, 14, 6, 1, 4, 11, 2, 0, 15, 10, 7, 9]
// Resulting wiring: [12, 8, 3, 13, 5, 14, 6, 1, 4, 11, 2, 0, 15, 10, 7, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[6], q[1];
cx q[1], q[0];
cx q[10], q[13];
cx q[9], q[14];
cx q[14], q[13];
cx q[6], q[9];
