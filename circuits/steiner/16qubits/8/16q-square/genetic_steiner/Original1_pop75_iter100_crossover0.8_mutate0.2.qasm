// Initial wiring: [15, 7, 0, 11, 6, 3, 14, 8, 4, 1, 2, 5, 13, 9, 12, 10]
// Resulting wiring: [15, 7, 0, 11, 6, 3, 14, 8, 4, 1, 2, 5, 13, 9, 12, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[6], q[5];
cx q[10], q[9];
cx q[14], q[13];
cx q[12], q[13];
cx q[6], q[9];
cx q[9], q[14];
cx q[3], q[4];
