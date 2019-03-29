// Initial wiring: [7, 14, 18, 0, 16, 6, 17, 1, 2, 5, 3, 13, 15, 11, 8, 12, 9, 10, 19, 4]
// Resulting wiring: [7, 14, 18, 0, 16, 6, 17, 1, 2, 5, 3, 13, 15, 11, 8, 12, 9, 10, 19, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[7];
cx q[14], q[5];
cx q[15], q[13];
cx q[9], q[10];
