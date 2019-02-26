// Initial wiring: [0 2 1 3 4 5 7 8 6]
// Resulting wiring: [0 2 1 3 4 5 7 8 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[6], q[5];
cx q[3], q[8];
