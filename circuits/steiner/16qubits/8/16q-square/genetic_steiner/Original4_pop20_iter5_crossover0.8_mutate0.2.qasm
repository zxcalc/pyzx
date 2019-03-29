// Initial wiring: [14, 4, 13, 9, 2, 8, 5, 6, 11, 7, 15, 1, 10, 3, 0, 12]
// Resulting wiring: [14, 4, 13, 9, 2, 8, 5, 6, 11, 7, 15, 1, 10, 3, 0, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[5], q[4];
cx q[6], q[5];
cx q[14], q[9];
cx q[11], q[12];
cx q[10], q[11];
cx q[11], q[12];
cx q[9], q[14];
cx q[8], q[9];
cx q[9], q[14];
cx q[14], q[9];
cx q[5], q[6];
cx q[4], q[5];
cx q[5], q[6];
cx q[6], q[5];
cx q[3], q[4];
cx q[1], q[6];
