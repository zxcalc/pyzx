// Initial wiring: [0 2 1 3 4 7 6 5 8]
// Resulting wiring: [0 2 1 3 4 7 6 5 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
cx q[0], q[5];
cx q[8], q[7];
