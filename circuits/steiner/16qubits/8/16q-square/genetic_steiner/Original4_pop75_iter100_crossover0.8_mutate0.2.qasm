// Initial wiring: [6, 13, 7, 1, 15, 10, 12, 14, 0, 3, 8, 2, 9, 5, 4, 11]
// Resulting wiring: [6, 13, 7, 1, 15, 10, 12, 14, 0, 3, 8, 2, 9, 5, 4, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[14], q[13];
cx q[15], q[8];
cx q[12], q[13];
cx q[11], q[12];
cx q[12], q[13];
cx q[12], q[11];
cx q[10], q[13];
cx q[10], q[11];
cx q[4], q[5];
