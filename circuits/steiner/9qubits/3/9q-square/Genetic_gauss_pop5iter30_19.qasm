// Initial wiring: [0 1 2 8 4 5 7 6 3]
// Resulting wiring: [0 1 3 8 4 5 7 6 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[2], q[3];
cx q[2], q[3];
cx q[8], q[3];
cx q[8], q[7];
