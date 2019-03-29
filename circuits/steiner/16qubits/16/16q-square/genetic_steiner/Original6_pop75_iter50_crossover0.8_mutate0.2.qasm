// Initial wiring: [12, 8, 9, 10, 3, 2, 7, 15, 4, 14, 13, 6, 11, 5, 0, 1]
// Resulting wiring: [12, 8, 9, 10, 3, 2, 7, 15, 4, 14, 13, 6, 11, 5, 0, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[4], q[3];
cx q[7], q[6];
cx q[6], q[1];
cx q[10], q[9];
cx q[11], q[10];
cx q[12], q[11];
cx q[11], q[10];
cx q[10], q[5];
cx q[15], q[14];
cx q[14], q[15];
cx q[12], q[13];
cx q[5], q[10];
cx q[4], q[11];
cx q[0], q[1];
