// Initial wiring: [17, 18, 5, 2, 3, 1, 7, 8, 15, 0, 4, 12, 14, 10, 19, 16, 13, 9, 6, 11]
// Resulting wiring: [17, 18, 5, 2, 3, 1, 7, 8, 15, 0, 4, 12, 14, 10, 19, 16, 13, 9, 6, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[8];
cx q[13], q[7];
cx q[15], q[14];
cx q[6], q[7];
