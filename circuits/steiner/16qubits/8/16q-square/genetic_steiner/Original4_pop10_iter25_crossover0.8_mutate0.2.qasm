// Initial wiring: [6, 10, 15, 1, 7, 14, 3, 0, 11, 8, 9, 2, 13, 5, 4, 12]
// Resulting wiring: [6, 10, 15, 1, 7, 14, 3, 0, 11, 8, 9, 2, 13, 5, 4, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[8], q[7];
cx q[14], q[13];
cx q[10], q[11];
cx q[11], q[10];
cx q[9], q[10];
cx q[10], q[13];
cx q[10], q[11];
cx q[11], q[10];
cx q[2], q[3];
