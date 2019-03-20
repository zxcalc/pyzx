// Initial wiring: [0 1 2 3 4 5 7 6 8]
// Resulting wiring: [0 1 2 8 4 5 3 6 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[8];
cx q[7], q[8];
cx q[7], q[8];
cx q[8], q[3];
cx q[8], q[3];
cx q[2], q[3];
