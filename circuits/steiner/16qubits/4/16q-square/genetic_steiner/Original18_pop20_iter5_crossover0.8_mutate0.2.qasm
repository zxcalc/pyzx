// Initial wiring: [10, 14, 0, 5, 15, 13, 8, 7, 3, 1, 11, 4, 12, 9, 2, 6]
// Resulting wiring: [10, 14, 0, 5, 15, 13, 8, 7, 3, 1, 11, 4, 12, 9, 2, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[12], q[11];
cx q[14], q[13];
cx q[12], q[13];
cx q[11], q[12];
cx q[4], q[11];
cx q[11], q[12];
cx q[12], q[11];
