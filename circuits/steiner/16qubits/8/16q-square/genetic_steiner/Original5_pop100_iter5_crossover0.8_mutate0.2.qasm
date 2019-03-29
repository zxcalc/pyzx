// Initial wiring: [3, 9, 12, 15, 2, 7, 0, 14, 8, 5, 6, 1, 4, 13, 10, 11]
// Resulting wiring: [3, 9, 12, 15, 2, 7, 0, 14, 8, 5, 6, 1, 4, 13, 10, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[11], q[10];
cx q[14], q[9];
cx q[9], q[6];
cx q[14], q[9];
cx q[15], q[8];
cx q[10], q[13];
cx q[6], q[9];
cx q[4], q[11];
cx q[11], q[12];
cx q[1], q[6];
cx q[6], q[9];
cx q[9], q[6];
