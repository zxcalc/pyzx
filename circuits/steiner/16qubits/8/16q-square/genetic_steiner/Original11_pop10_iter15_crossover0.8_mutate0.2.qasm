// Initial wiring: [7, 1, 5, 11, 0, 6, 15, 3, 8, 10, 13, 4, 2, 9, 14, 12]
// Resulting wiring: [7, 1, 5, 11, 0, 6, 15, 3, 8, 10, 13, 4, 2, 9, 14, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[10], q[5];
cx q[5], q[2];
cx q[2], q[1];
cx q[14], q[13];
cx q[12], q[13];
cx q[5], q[10];
cx q[10], q[13];
cx q[2], q[5];
cx q[5], q[4];
cx q[1], q[2];
cx q[2], q[3];
cx q[3], q[4];
cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[5];
cx q[5], q[10];
cx q[2], q[1];
cx q[5], q[2];
cx q[10], q[5];
