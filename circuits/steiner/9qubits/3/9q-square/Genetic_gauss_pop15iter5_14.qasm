// Initial wiring: [0 2 1 3 7 5 6 8 4]
// Resulting wiring: [0 2 1 3 7 5 6 8 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[3];
cx q[0], q[1];
cx q[8], q[7];
