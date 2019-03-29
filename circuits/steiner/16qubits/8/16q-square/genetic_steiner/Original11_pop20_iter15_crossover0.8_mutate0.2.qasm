// Initial wiring: [7, 13, 0, 5, 11, 15, 8, 10, 2, 9, 6, 1, 4, 3, 14, 12]
// Resulting wiring: [7, 13, 0, 5, 11, 15, 8, 10, 2, 9, 6, 1, 4, 3, 14, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[11], q[4];
cx q[4], q[3];
cx q[3], q[2];
cx q[4], q[3];
cx q[13], q[10];
cx q[10], q[9];
cx q[14], q[9];
cx q[10], q[13];
cx q[8], q[9];
cx q[9], q[10];
cx q[6], q[9];
cx q[9], q[10];
cx q[10], q[13];
cx q[10], q[9];
cx q[13], q[10];
cx q[0], q[1];
