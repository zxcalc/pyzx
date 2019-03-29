// Initial wiring: [2, 10, 9, 13, 7, 0, 3, 8, 1, 5, 6, 15, 14, 4, 11, 12]
// Resulting wiring: [2, 10, 9, 13, 7, 0, 3, 8, 1, 5, 6, 15, 14, 4, 11, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[14], q[13];
cx q[15], q[0];
cx q[12], q[13];
cx q[9], q[10];
cx q[10], q[11];
cx q[5], q[10];
cx q[4], q[5];
