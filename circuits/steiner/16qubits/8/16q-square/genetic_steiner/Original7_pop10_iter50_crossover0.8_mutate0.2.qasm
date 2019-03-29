// Initial wiring: [12, 15, 14, 1, 8, 11, 7, 13, 5, 3, 2, 0, 4, 6, 10, 9]
// Resulting wiring: [12, 15, 14, 1, 8, 11, 7, 13, 5, 3, 2, 0, 4, 6, 10, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[10], q[5];
cx q[14], q[9];
cx q[9], q[6];
cx q[14], q[13];
cx q[14], q[9];
cx q[12], q[13];
cx q[6], q[9];
cx q[5], q[6];
cx q[6], q[9];
cx q[4], q[11];
