// Initial wiring: [5, 3, 13, 15, 8, 4, 11, 2, 14, 1, 6, 12, 7, 10, 0, 9]
// Resulting wiring: [5, 3, 13, 15, 8, 4, 11, 2, 14, 1, 6, 12, 7, 10, 0, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[10], q[9];
cx q[14], q[9];
cx q[9], q[6];
cx q[14], q[9];
cx q[15], q[8];
cx q[6], q[9];
cx q[9], q[8];
cx q[8], q[15];
cx q[5], q[6];
cx q[6], q[9];
cx q[9], q[8];
cx q[8], q[15];
cx q[9], q[6];
cx q[15], q[8];
cx q[4], q[11];
cx q[4], q[5];
