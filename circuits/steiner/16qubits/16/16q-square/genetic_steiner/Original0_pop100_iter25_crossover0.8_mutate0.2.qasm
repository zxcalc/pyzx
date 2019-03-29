// Initial wiring: [5, 15, 4, 8, 7, 11, 2, 6, 9, 12, 14, 10, 1, 0, 13, 3]
// Resulting wiring: [5, 15, 4, 8, 7, 11, 2, 6, 9, 12, 14, 10, 1, 0, 13, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[5], q[2];
cx q[14], q[9];
cx q[9], q[8];
cx q[14], q[9];
cx q[14], q[15];
cx q[10], q[11];
cx q[9], q[10];
cx q[10], q[11];
cx q[9], q[14];
cx q[11], q[12];
cx q[7], q[8];
cx q[6], q[9];
cx q[9], q[14];
cx q[5], q[10];
cx q[10], q[11];
cx q[11], q[12];
cx q[12], q[11];
cx q[4], q[11];
