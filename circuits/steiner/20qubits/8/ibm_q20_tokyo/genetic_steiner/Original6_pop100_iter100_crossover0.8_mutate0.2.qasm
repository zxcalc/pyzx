// Initial wiring: [17, 7, 12, 8, 11, 15, 2, 6, 10, 19, 18, 14, 16, 1, 13, 9, 3, 0, 4, 5]
// Resulting wiring: [17, 7, 12, 8, 11, 15, 2, 6, 10, 19, 18, 14, 16, 1, 13, 9, 3, 0, 4, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[11], q[9];
cx q[13], q[6];
cx q[14], q[5];
cx q[16], q[13];
cx q[13], q[7];
cx q[10], q[11];
cx q[1], q[7];
