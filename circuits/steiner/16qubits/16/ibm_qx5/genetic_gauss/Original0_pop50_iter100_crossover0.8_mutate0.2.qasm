// Initial wiring: [6, 0, 9, 3, 7, 2, 15, 14, 5, 8, 11, 1, 12, 4, 13, 10]
// Resulting wiring: [6, 0, 9, 3, 7, 2, 15, 14, 5, 8, 11, 1, 12, 4, 13, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[7];
cx q[12], q[2];
cx q[14], q[2];
cx q[14], q[3];
cx q[12], q[7];
cx q[12], q[15];
cx q[11], q[15];
cx q[7], q[11];
cx q[10], q[13];
cx q[0], q[2];
cx q[4], q[15];
cx q[5], q[14];
cx q[5], q[12];
cx q[4], q[9];
